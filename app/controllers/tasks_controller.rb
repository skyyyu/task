class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :state_plus_one]
  before_action :sign_in_required

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(user_id: current_user.id)
    @search = @tasks.search(params[:q])
    @tasks = @search.result(distinct: true)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
   
    respond_to do |format|
      if @task.save
        NotificationMailer.send_confirm_to_user(@task).deliver_later
        format.html { redirect_to @task, notice: 'タスクを追加しました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'タスクを更新しました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
    @post = Post.new(permit_params)
    @post.save!
    redirect_to action: 'show'
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'タスクを削除しました' }
      format.json { head :no_content }
    end
  end
 
  def state_plus_one
    if @task.state == "not_started_yet"
      @task.state = "in_progress"
    elsif @task.state == "in_progress"
      @task.state = "done"
    end
    @task.save
    redirect_to tasks_url, notice: '更新しました' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :deadline, :detail, :time, :state, :image)
    end

    

end

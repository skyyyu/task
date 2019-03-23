class MonsterModelController < ApplicationController
	def index
		@monsters = MonsterModel.all
	end

	def show
		@monster = MonsterModel.find_by(id: params[:id])
	end

	def new

	end

	def create
		@monster = MonsterModel.create(
			name: params[:name],
			Offensive_power: params[:Offensive_power],
			Defense_power: params[:Defense_power]
		)
		redirect_to("/monsters")
	end

	def update
		@monster = MonsterModel.find_by(id: params[:id])
		@monster.update(
			name: params[:name],
			Offensive_power: params[:Offensive_power],
			Defense_power: params[:Defense_power]
		)
		redirect_to("/monsters")
	end

	def edit
		@monster = MonsterModel.find_by(id: params[:id])
	end

	def destroy
		@monster = MonsterModel.find_by(id: params[:id])
		@monster.destroy
        redirect_to("/monsters")
	end

end

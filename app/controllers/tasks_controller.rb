class TasksController < ApplicationController
  def index
  	#@task = Task.new(task_params)
  	#@tasks = Task.all
  	@complete = Task.where(complete: true)
  	@incomplete = Task.where(complete: false)

  end

  def create
  	@task = Task.new(task_params)
  	if @task.save
  		flash[:success] = "Task added successfully"  		
  	else
  		flash[:notice] = "Task failed to be added"
  	end
  	redirect_to tasks_path
  	#render "index"
  end

  def show
  end

  def update
  	@task = Task.find(params[:id])
  	@task.update_attributes!(task_params)
  	respond_to do |format|
  		format.html { redirect_to tasks_path }
  		format.js
  	end
  end

  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  	respond_to do |format|
  		format.html { redirect_to tasks_path }
  		format.js
  	end
  end


  private

  	def task_params
  		params.require(:task).permit(:content, :complete)
  	end

end

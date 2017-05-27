class TasksController < ApplicationController

	def new
		@task = Task.new
    end

    def create
    	@task = Task.new(task_params)
        @task.id_user = session[:user_id]
        @task.idDayWeek = (@task.date.wday + 1)
    	if @task.save
    		redirect_to dashboard_url(:id => session[:user_id])
    	else 
    		render action: :new
    	end
    end

    def update
      @task = Task.find(task_params[:id])
      task_params[:spentTime] = calc_horas(@task.spentTime, task_params[:spentTime].to_i)
      @task.update_attributes(task_params)
        
      redirect_to dashboard_url(:id => session[:user_id])
    end

    def dashboard
      @comando_sql = "SELECT * FROM tasks WHERE id_user = #{params[:id]} ORDER BY updated_at DESC LIMIT 8"
      @tasks = Task.find_by_sql(@comando_sql)
    end

    def semanaAtual
    	@dia1 = Date.today - ((0 - Time.now.wday) * -1)
        @dia2 = @dia1 + 6

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:00'"
        @totalWeek1 = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT title, spentTime FROM tasks WHERE id_user = #{params[:id]} AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:00' ORDER BY date"
        @tasks = Task.find_by_sql(@comando_sql)
    end

    def relatorios
        @dia1 = Date.today - ((0 - Time.now.wday - 14) * -1)
        @dia2 = @dia1 + 6

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:00'"
        @totalWeek3 = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT COUNT(t.id) as qnt, SUM(spentTime) as hours, name as day FROM tasks t, weeks w WHERE t.idDayWeek = w.id AND id_user = #{params[:id]} AND "
        @comando_sql += "t.date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND t.date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:00' GROUP BY idDayWeek"
        @week3Tasks = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 1 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week3School = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 2 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week3Fun = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 3 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week3Job = Task.find_by_sql(@comando_sql)



        @dia1 = @dia1 + 7
        @dia2 = @dia1 + 6

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:00'"
        @totalWeek2 = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT COUNT(t.id) as qnt, SUM(spentTime) as hours, name as day FROM tasks t, weeks w WHERE t.idDayWeek = w.id AND id_user = #{params[:id]} AND "
        @comando_sql += "t.date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND t.date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:59' GROUP BY idDayWeek"
        @week2Tasks = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 1 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week2School = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 2 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week2Fun = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 3 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week2Job = Task.find_by_sql(@comando_sql)



        @dia1 = @dia1 + 7
        @dia2 = @dia1 + 6

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:00'"
        @totalWeek1 = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT COUNT(t.id) as qnt, SUM(spentTime) as hours, name as day FROM tasks t, weeks w WHERE t.idDayWeek = w.id AND id_user = #{params[:id]} AND "
        @comando_sql += "t.date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND t.date <= '"+ @dia2.strftime("%Y-%m-%d") +" 23:59:59' GROUP BY idDayWeek"
        @week1Tasks = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 1 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week1School = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 2 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week1Fun = Task.find_by_sql(@comando_sql)

        @comando_sql = "SELECT SUM(spentTime) as total FROM tasks WHERE id_user = #{params[:id]} AND id_category = 3 AND date >= '"+ @dia1.strftime("%Y-%m-%d") +"' AND date <= '"+ @dia2.strftime("%Y-%m-%d") +"'"
        @week1Job = Task.find_by_sql(@comando_sql)
    end

    def calc_horas(atual, nova)
    	nova = atual + nova;

    	if(nova == nil)
    		nova = 0
    	end

    	return nova
    end

    def primeiro_dia_semana
        @primeiro_dia = Date.today - ((0 - Time.now.wday) * -1)
        return @primeiro_dia
    end

    def week_tasks(dia)
        @dia1_semana = primeiro_dia_semana()

        @comando_sql = "SELECT * FROM tasks WHERE idDayWeek = #{dia} AND date >='"+ @dia1_semana.strftime("%Y-%m-%d") +"' AND date <='"+ (@dia1_semana + 6).strftime("%Y-%m-%d") +" 23:59:59' ORDER BY date DESC LIMIT 3"

        @sundayTasks = Task.find_by_sql(@comando_sql)
    end

    def calc_proporcao(total, tarefa)
    	@prop = ((tarefa * 100.0) / total).round(2)
    end
    helper_method :week_tasks, :calc_proporcao, :selection

    private
    def task_params
    	params.require(:task).permit(:title, :description, :spentTime, :id_category, :created_at, :date, :id, :done)
    end
end

class IncomesController < ApplicationController
  def index
    @incomes = Income.where(user_id: current_user.id).order(year_month: :DESC)
    @goukei = @incomes.sum(:value)
    @kongetunoincomes = @incomes.where(year_month: Time.now.all_month).all.sum(:value)
    d = Date.today
    @month = d.month
    @user = current_user.name
   end
  
   def show
     @income = Income.find(params[:id])
     render 'index'
   end
  
   def new
     @income = Income.new
   end
  
   def edit
     @income = Income.find(params[:id])
   end
 
   def create
     @income = Income.new(income_params)
     if @income.valid?
      @income.save
      redirect_to :incomes
     else
      render :new
     end
   end
    
   def update
     @income = Income.find(params[:id])
     # @income.assign_attributes(params[:income])
     if
     @income.update(income_params)
     redirect_to incomes_path(@income)
     else
       render "new"
     end
   end
  
   def destroy
     @income = Income.find(params[:id])
     @income.destroy
     redirect_to :incomes
   end
 
   private 
 
   def income_params
     params.require(:income).permit(:category, :year_month, :value).merge(user_id: current_user.id)
   end
  
end

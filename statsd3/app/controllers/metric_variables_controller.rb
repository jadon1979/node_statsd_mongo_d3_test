class MetricVariablesController < ApplicationController
  before_action :set_metric_variable, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  def index
    @metric_variables = MetricVariable.all
    respond_with @metric_variables
  end

  def show
  end

  def new
    @metric_variable = MetricVariable.new
  end

  def edit
  end

  def create    
    @metric_variable = MetricVariable.new(metric_variable_params)
    flash[:notice] = 'Metric variable was successfully created.' if @metric_variable.save
    respond_with @metric_variable
  end

  def update
    if @metric_variable.update(metric_variable_params)
      flash[:notice] = 'Metric variable was successfully updated.'
    end
    respond_with @metric_variable
  end

  def destroy
    if @metric_variable.destroy
      flash[:notice] = 'Metric variable was successfully destroyed.'
    end
    respond_with @metric_variable
  end

  private

    def set_metric_variable
      @metric_variable = MetricVariable.find(params[:id])
    end

    def metric_variable_params
      params.require(:metric_variable).permit(:name, :metric_abr, :sample_rate)
    end
end

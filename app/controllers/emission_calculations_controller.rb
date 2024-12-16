class EmissionCalculationsController < ApplicationController
  def index
    @emission_calculations = EmissionCalculation.all
  end

  def show
    @emission_calculation = EmissionCalculation.find(params[:id])
  end

  def create
    @emission_calculation = EmissionCalculation.new(emission_calculation_params)
    if @emission_calculation.save
      redirect_to @emission_calculation, notice: 'Emission calculation was successfully created.'
    else
      render :show
    end
  end

  private

  def emission_calculation_params
    params.require(:emission_calculation).permit(:file, :name)
  end
end
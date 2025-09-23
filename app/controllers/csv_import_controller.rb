class CsvImportController < ApplicationController
  def new
  end

  def create
    file = params[:file]

    CsvImportService.new(file).import!
    redirect_to users_path, notice: "CSV imported successfully"
  end
end

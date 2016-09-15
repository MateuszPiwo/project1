class ExamplesController < ApplicationController
  def show
    example = Example.find(params[:id])
    render json: example.to_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Record not found.' }, status: :not_found
  end

  def create
    Example.create!(
      flower: params[:example][:flower],
      cup: params[:example][:cup],
      date: params[:example][:date],
    )
    head :ok
  end

  def update
    example_form = ExampleForm.new(Example.find(params[:id]))
    example_form.validate(params[:example])
    example_form.sync
    example_form.save!
    render json: example_form.model.to_json, status: :ok
  end
end
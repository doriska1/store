# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authorize_request
  before_action :set_item, only: %i[show update destroy destroy_tag_from_item]

  # GET /items
  def index
    @items = current_user.items

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = current_user.items.new(item_params)
    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item, status: :found
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    render json: {}, status: :no_content
  end

  def destroy_tag_from_item
    tag = @item.tags.find(params[:tag_id])
    @item.tags.delete(tag)
    render json: @item, status: :found
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = current_user.items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :price, :text, tags: [:name])
  end
end

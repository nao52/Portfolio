class ChannelCommentsController < ApplicationController
  before_action :require_login
  before_action :set_channel, only: %i[new create]
  before_action :set_channel_comment, only: %i[edit update]

  def new
    @channel_comment = current_user.channel_comments.build
  end

  def create
    @channel_comment = current_user.channel_comments.build(channel_comment_params)

    if @channel_comment.save
      redirect_to channel_path(@channel), success: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @channel_comment.update(channel_comment_params)
      redirect_to channel_path(@channel_comment.channel_id), success: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def channel_comment_params
    params.require(:channel_comment).permit(:body, :channel_id)
  end

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end

  def set_channel_comment
    @channel_comment = ChannelComment.find(params[:id])
  end
end
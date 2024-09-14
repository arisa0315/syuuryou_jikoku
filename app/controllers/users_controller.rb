class UsersController < ApplicationController
  def new
    # 新規ユーザー登録用のインスタンスを作成
    @user = User.new
  end

  def create
    # 新規ユーザーを作成
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザーが登録されました。'
    else
      render :new
    end
  end

  private

  # Strong Parameters: ユーザー作成時に許可するパラメータ
  def user_params
    params.require(:user).permit(:username, :shift_id)
  end
end

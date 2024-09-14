class ShiftsController < ApplicationController
  def index
    # シフトの一覧表示（トップページ）
    @shifts = Shift.all
  end

  def new
    # 新規シフト登録用のインスタンスを作成
    @shift = Shift.new
  end

  def create
    # 新規シフトの作成
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to root_path, notice: 'シフトが登録されました。'
    else
      render :new
    end
  end

  def edit
    # シフトの編集
    @shift = Shift.find(params[:id])
  end

  def update
    # シフトの更新
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to root_path, notice: 'シフトが更新されました。'
    else
      render :edit
    end
  end

  private

  # Strong Parameters: シフト作成・更新時に許可するパラメータ
  def shift_params
    params.require(:shift).permit(:shift_name, :cycle_time, :performance, :start_time)
  end
end

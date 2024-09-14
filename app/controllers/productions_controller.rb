class ProductionsController < ApplicationController
  def new
    # 新規生産数入力用のインスタンスを作成
    @production = Production.new
  end

  def create
    # 新規生産数を作成
    @production = Production.new(production_params)
    @production.calculate_end_time # 生産終了時刻の計算を呼び出す
    if @production.save
      redirect_to root_path, notice: '生産数が登録されました。'
    else
      render :new
    end
  end

  def edit
    # 生産数の編集
    @production = Production.find(params[:id])
  end

  def update
    # 生産数の更新
    @production = Production.find(params[:id])
    @production.calculate_end_time # 生産終了時刻を再計算
    if @production.update(production_params)
      redirect_to root_path, notice: '生産数が更新されました。'
    else
      render :edit
    end
  end

  private

  # Strong Parameters: 生産数作成・更新時に許可するパラメータ
  def production_params
    params.require(:production).permit(:shift_id, :production_quantity)
  end
end

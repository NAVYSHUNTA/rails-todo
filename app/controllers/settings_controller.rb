class SettingsController < ApplicationController
  def edit
    @setting = Setting.first || Setting.new
  end

  def update
    @setting = Setting.first || Setting.new
    if @setting.update(setting_params)
      redirect_to todos_path, notice: "設定を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:default_deadline_days, :default_deadline_hours, :default_deadline_minutes)
  end
end

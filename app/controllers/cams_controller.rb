class CamsController < ApplicationController
    def update
      @cam = Cam.find(params[:id])
      if @cam.update(cam_params)
        redirect_to request.referrer || root_url
      else
        render 'edit'
      end
    end

    private

      def cam_params
        params.require(:cam).permit(:control_address, :status_address, :control_type, :control_value)
      end

end

# frozen_string_literal: true
module AreasHelper
  def device_with_type(area, types)
    area.devices.where('i_type' => types)
  end
end

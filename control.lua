local function register_with_diesel_locomotive()
  if remote.interfaces["Diesel-Locomotive_loco_tank_pair_list"] then
    remote.call(
      "Diesel-Locomotive_loco_tank_pair_list",
      "add_loco_tank_pair",
      "chonky-locomotive",
      "Diesel-Locomotive-fluid-locomotive-proxy-tank-")
  end
end

script.on_init(register_with_diesel_locomotive)
script.on_configuration_changed(register_with_diesel_locomotive)

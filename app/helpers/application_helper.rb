module ApplicationHelper

  def depots
    Depot.order(:index)
  end

  def depots_size
    depots.size
  end

  def limit
    depots_size - 1
  end

  def capacity
    Capacity.last.try(:limit) || 40
  end

  def demands
    depots.collect(&:demand)
  end

  def clean_cycle!
    RouteCycle.destroy_all
  end

  def clean_depot!
    Depot.destroy_all
  end

  def clean_employee!
    Employee.destroy_all
  end

  def symmetric_costs
    symmetric_costs = []
    depots.each do |depot|
      symmetric_costs << depot.symmetric_costs.split(/\,/).map(&:strip)
    end
    symmetric_costs
  end

  def populate_depots
    clean_depot!
    Depot.create(name: "Sector 1, Dhaka 1230, Bangladesh", latitude: 23.8587004, longitude: 90.4001495, demand: 0, symmetric_costs: "0,10,3,8,44,43,32,36,38,26,22,32", index: 0)
    Depot.create(name: "Abdullahpur Bus Stop, Dhaka - Ashuliya Highway, Dha...", latitude: 23.8797505, longitude: 90.4011432, demand: 15, symmetric_costs: "10,0,10,13,40,47,38,42,43,31,27,37", index: 1)
    Depot.create(name: "Jasimuddin Bus Stop, Dhaka 1230, Bangladesh", latitude: 23.8607779, longitude: 90.3999246, demand: 10, symmetric_costs: "3,10,0,4,42,40,30,33,35,23,19,28", index: 2)
    Depot.create(name: "Airport Bus Stand, Dhaka - Mymensingh Hwy, Dhaka 12...", latitude: 23.8515155, longitude: 90.4078969, demand: 18, symmetric_costs: "8,13,4,0,39,37,27,30,31,19,16,25", index: 3)
    Depot.create(name: "Mazar Road Bus Stop, Mazar Road, Dhaka, Bangladesh", latitude: 23.783057, longitude: 90.3470841, demand: 15, symmetric_costs: "44,40,42,39,0,10,18,17,19,26,29,24", index: 4)
    Depot.create(name: "Kallyanpur Bus Stop, Mirpur Rd, Dhaka, Bangladesh", latitude: 23.777889, longitude: 90.3609987, demand: 20, symmetric_costs: "43,47,40,37,10,0,17,11,14,21,24,19", index: 5)
    Depot.create(name: "Mirpur 10 Bus Stopage, Dhaka, Bangladesh", latitude: 23.806744, longitude: 90.3685548999999, demand: 10, symmetric_costs: "32,38,30,27,18,17,0,12,20,19,19,22", index: 6)
    Depot.create(name: "ShewraPara Bus Stand, Rokeya Sarani, Dhaka 1216, Ba...", latitude: 23.7903011, longitude: 90.3756939, demand: 15, symmetric_costs: "36,42,33,30,17,11,12,0,16,18,18,18", index: 7)
    Depot.create(name: "Khamarbari Bus Stand, Manik Mia Ave, Dhaka, Banglad...", latitude: 23.7584432, longitude: 90.3830007, demand: 20, symmetric_costs: "38,43,35,31,19,14,20,16,0,14,17,13", index: 8)
    Depot.create(name: "Shainik Club Bus Stop, Dhaka, Bangladesh", latitude: 23.7904204, longitude: 90.4000783, demand: 10, symmetric_costs: "26,31,23,19,26,21,19,18,14,0,6,12", index: 9)
    Depot.create(name: "Banani South Bus Stop, Dhaka - Mymensingh Hwy, Dhak...", latitude: 23.7933164, longitude: 90.4010332, demand: 17, symmetric_costs: "22,27,19,16,29,24,19,18,17,6,0,10", index: 10)
    Depot.create(name: "Mohakhali Bus Stop, Dhaka, Bangladesh", latitude: 23.7782392, longitude: 90.3977394, demand: 10, symmetric_costs: "32,37,28,25,24,19,22,18,13,12,10,0", index: 11)
  end

  def populate_employee
    clean_employee!
    depots.each do |depot|
      depot.demand.times do |n|
        Employee.create(name: "Rokibul Hasan #{depot.index}-#{n}", title: "Software Engineer", depot_id: depot.id)
      end
    end
  end
end

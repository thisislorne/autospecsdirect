searches = [{"Search":"luxury minivan","Query":"New 2019 Luxury Minivans","Weighting":10},{"Search":"luxury minivan","Query":"Low Prices on Luxury Minivans","Weighting":10},{"Search":"luxury minivan","Query":"Best Luxury Minivan Deal","Weighting":10},{"Search":"luxury minivan","Query":"Luxury Minivans for Sale","Weighting":10},{"Search":"luxury minivan","Query":"Luxury Vans for Sale","Weighting":10},{"Search":"conversion van","Query":"Conversion Van","Weighting":10},{"Search":"conversion van","Query":"Conversion Vans for Sale","Weighting":10},{"Search":"conversion van","Query":"Used Conversion Vans","Weighting":10},{"Search":"conversion van","Query":"Used Conversion Vans for Sale","Weighting":10},{"Search":"conversion van","Query":"Luxury Conversion Vans for Sale","Weighting":10},{"Search":"business pens","Query":"Bulk Business Pens","Weighting":10},{"Search":"business pens","Query":"Order Business Pens in Bulk","Weighting":10},{"Search":"business pens","Query":"Personalized Pens Bulk","Weighting":10},{"Search":"business pens","Query":"Bulk Custom Pens","Weighting":10},{"Search":"business pens","Query":"Customized Pens Online","Weighting":10},{"Search":"business pens","Query":"Top Quality Pens","Weighting":10},{"Search":"business pens","Query":"Top Business Pens","Weighting":10},{"Search":"asthma inhaler","Query":"Nucala Symbicort Bevespi Inhaler Spiriva","Weighting":10},{"Search":"asthma inhaler","Query":"Ground Breaking Asthma Treatments","Weighting":10},{"Search":"asthma inhaler","Query":"Asthma Medications","Weighting":10},{"Search":"asthma inhaler","Query":"Top Asthma Inhaler","Weighting":10},{"Search":"asthma inhaler","Query":"Discount Asthma Inhaler","Weighting":10},{"Search":"small suv","Query":"Best New Small SUV 2019","Weighting":10},{"Search":"small suv","Query":"Best Compact Crossover SUV","Weighting":10},{"Search":"small suv","Query":"Best Midsize SUV to Buy","Weighting":10},{"Search":"small suv","Query":"Luxury SUVs","Weighting":10},{"Search":"small suv","Query":"Best Compact SUV","Weighting":10}]

searches.each do |search|
  s = Search.find_or_create_by(slug: search[:Search])
  s.queries.create(query: search[:Query], weighting: search[:Weighting])
end
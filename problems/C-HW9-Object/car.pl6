#!/usr/bin/env perl6

enum Type <Truck Four-DoorSedan Two-DoorSedan Van Station-Wagon Convertibles Sports>;

enum Brand <Acura Audi BMW Buick Honda Hyundai Jaguar Kia Lexus Mazda Toyota>;

enum State <AZ CA CO MA MN NM NV OK>;



class Car {
    
    has Brand $.brand is required;
    has Type $.type is required;
    has Int $.year is required;

    has Str $.owner is required;
    has State $.state is required;


    method register {
        sprintf "%s %s %s" ,
                  $!brand,
                  $!type,
                  $!year
    
    }


    my Car $car1 .= new(brand => Hyundai, type => Truck, year => 2016, owner => 'Brian Smith', state => AZ);

    my Car $car2 .= new(brand => Audi, type => Station-Wagon, year => 2000, owner => 'Neil Armstrong', state => OK);

    my Car $car3 .= new(brand => BMW, type => Four-DoorSedan, year => 2005, owner => 'Angel Lee', state => CA);


    for $car1, $car2, $car3 {

        printf "\n%s has registered : %s at MVD in state of %s.\n", .owner, .register, .state;
    }


}

HotDrinkMachine machine = new HotDrinkMachine();
IHotDrink drink = machine.makeDrink(HotDrinkMachine.AvailableDrink.Tea, 100);
drink.consume();
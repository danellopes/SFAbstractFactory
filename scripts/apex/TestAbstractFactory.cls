HotDrinkMachine machine = new HotDrinkMachine();

System.debug('Available drinks: ');
for(String drink : machine.getAvailableDrinks())
{
    System.debug(drink);
}

IHotDrink drink = machine.makeDrink('Tea', 100);
drink.consume();
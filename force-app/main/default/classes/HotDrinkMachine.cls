public class HotDrinkMachine {
    public class HotDrinkMachineException extends Exception {}
    private Map<String, IHotDrinkFactory> factories = new Map<String, IHotDrinkFactory>();

    public HotDrinkMachine() {
        List<ApexTypeImplementor> hotDrinkFactories = [
            SELECT ClassName, ClassNamespacePrefix
            FROM ApexTypeImplementor 
            WHERE InterfaceName = 'IHotDrinkFactory' and IsConcrete=true
        ];

        for (ApexTypeImplementor drink : hotDrinkFactories) {
            Type factoryType = Type.forName(drink.ClassName);
            IHotDrinkFactory factory = (IHotDrinkFactory) factoryType.newInstance();
            factories.put(drink.ClassName.replace('Factory', ''), factory);
        }
    }

    public Set<String> getAvailableDrinks()
    {
        return factories.keySet();
    }

    public IHotDrink makeDrink(String drink, Integer amount)
    {
        if(!factories.containsKey(drink))
        {
            throw new HotDrinkMachineException('Drink not available.');
        }

        System.debug('Preparing chosen drink: ' + drink);

        return factories.get(drink).prepare(amount);
    }
}
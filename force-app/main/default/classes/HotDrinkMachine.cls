public class HotDrinkMachine {
    public enum AvailableDrink {
        Coffee, Tea
    }

    private Map<AvailableDrink, IHotDrinkFactory> factories = new Map<AvailableDrink, IHotDrinkFactory>();

    public HotDrinkMachine() {
        for (AvailableDrink drink : AvailableDrink.values()) {
            Type factoryType = Type.forName(drink.name() + 'Factory');
            IHotDrinkFactory factory = (IHotDrinkFactory) factoryType.newInstance();
            factories.put(drink, factory);
        }
    }

    public IHotDrink makeDrink(AvailableDrink drink, Integer amount)
    {
        return factories.get(drink).prepare(amount);
    }
}
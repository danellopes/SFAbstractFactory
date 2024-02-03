public class CoffeeFactory implements IHotDrinkFactory {
    public IHotDrink prepare(Integer amount)
    {
        System.debug(String.format('Grind some beans, boil water, pour {0} ml, add cream and sugar, enjoy!', new List<Object>{amount}));
        return new Coffee();
    }
}
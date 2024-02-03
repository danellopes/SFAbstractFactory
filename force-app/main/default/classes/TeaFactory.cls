public class TeaFactory implements IHotDrinkFactory {
    public IHotDrink prepare(Integer amount)
    {
        System.debug(String.format('Put in a tea bag, boil water, pour {0} ml, add lemon and enjoy!', new List<Object>{amount}));
        return new Tea();
    }
}
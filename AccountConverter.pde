import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class AccountConverter implements Converter {
  public boolean canConvert(Class clazz) {
    return clazz.equals(Account.class);
  }

  public void marshal(Object value, HierarchicalStreamWriter writer, MarshallingContext context) {
    Account account = (Account) value;

    writer.addAttribute("name", account.name);
    writer.addAttribute("amount", "" + account.amount);
    writer.addAttribute("id", account.id);
    writer.addAttribute("frozen", "" + account.frozen);
  }

  public Object unmarshal(HierarchicalStreamReader reader, UnmarshallingContext context) {
    try {
    String name = reader.getAttribute("name");
    double amount = Double.parseDouble( reader.getAttribute("amount"));
    String id = reader.getAttribute("id");
    boolean frozen = Boolean.parseBoolean(reader.getAttribute("frozen"));

    return new Account(name, amount, id, frozen);

    } catch (Exception e) {
      println(e);
      return null;
    }
  }
}

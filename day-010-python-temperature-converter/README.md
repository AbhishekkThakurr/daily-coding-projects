# Temperature Converter (Python)

Converts a temperature between Celsius and Fahrenheit from the command line.

## Concepts

- Functions (`celsius_to_fahrenheit`, `fahrenheit_to_celsius`)
- Command-line arguments with `sys.argv`
- Input validation and `float()` conversion
- f-strings with formatting (`:.2f` for two decimal places)

## How to run

```bash
python3 temperature_converter.py <value> <C|F>
```

## Sample run

```
$ python3 temperature_converter.py 100 C
100 C = 212.00 F

$ python3 temperature_converter.py 212 F
212 F = 100.00 C

$ python3 temperature_converter.py 37 C
37 C = 98.60 F
```

#!/usr/bin/env python3
"""Temperature Converter.

Converts between Celsius and Fahrenheit from the command line.

Usage:
    python3 temperature_converter.py <value> <C|F>
    python3 temperature_converter.py 100 C   # 100 Celsius -> Fahrenheit
    python3 temperature_converter.py 212 F   # 212 Fahrenheit -> Celsius
"""


def celsius_to_fahrenheit(celsius):
    """Convert a Celsius temperature to Fahrenheit."""
    return (celsius * 9 / 5) + 32


def fahrenheit_to_celsius(fahrenheit):
    """Convert a Fahrenheit temperature to Celsius."""
    return (fahrenheit - 32) * 5 / 9


def main():
    import sys

    if len(sys.argv) != 3:
        print("Usage: python3 temperature_converter.py <value> <C|F>")
        print("Example: python3 temperature_converter.py 100 C")
        sys.exit(1)

    try:
        value = float(sys.argv[1])
    except ValueError:
        print("Invalid temperature. Please enter a number.")
        sys.exit(1)

    unit = sys.argv[2].upper()
    if unit == "C":
        result = celsius_to_fahrenheit(value)
        print(f"{value:g} C = {result:.2f} F")
    elif unit == "F":
        result = fahrenheit_to_celsius(value)
        print(f"{value:g} F = {result:.2f} C")
    else:
        print("Invalid unit. Use C for Celsius or F for Fahrenheit.")
        sys.exit(1)


if __name__ == "__main__":
    main()

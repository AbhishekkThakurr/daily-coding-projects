def is_leap_year(year):
    """Return True if year is a leap year, else False.

    A year is a leap year if it is divisible by 400,
    or divisible by 4 but not by 100.
    """
    if year % 400 == 0:
        return True
    if year % 100 == 0:
        return False
    return year % 4 == 0


def main():
    year = int(input("Enter a year: "))
    if is_leap_year(year):
        print(f"{year} is a leap year.")
    else:
        print(f"{year} is not a leap year.")


if __name__ == "__main__":
    main()

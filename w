class Account:
    def __init__(self, account_number, name, balance=0):
        self.account_number = account_number
        self.name = name
        self.balance = balance

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"Deposit of ${amount:.2f} successful. Current balance: ${self.balance:.2f}")
        else:
            print("Please enter a valid deposit amount.")

    def withdraw(self, amount):
        if 0 < amount <= self.balance:
            self.balance -= amount
            print(f"Withdrawal of ${amount:.2f} successful. Current balance: ${self.balance:.2f}")
        else:
            print("Insufficient funds or invalid withdrawal amount.")

    def display_balance(self):
        print(f"Account Holder: {self.name}")
        print(f"Account Number: {self.account_number}")
        print(f"Current Balance: ${self.balance:.2f}")

class Bank:
    def __init__(self):
        self.accounts = {}

    def add_account(self, account):
        self.accounts[account.account_number] = account
        print(f"Account for {account.name} created successfully.")

    def get_account(self, account_number):
        return self.accounts.get(account_number)

def main():
    bank = Bank()

    while True:
        print("\n===== Text-based Banking System =====")
        print("1. Open Account")
        print("2. Deposit")
        print("3. Withdraw")
        print("4. Check Balance")
        print("5. Exit")

        choice = input("Enter your choice (1-5): ")

        if choice == "1":
            account_number = input("Enter account number: ")
            name = input("Enter account holder's name: ")
            account = Account(account_number, name)
            bank.add_account(account)

        elif choice == "2":
            account_number = input("Enter account number: ")
            amount = float(input("Enter deposit amount: "))
            account = bank.get_account(account_number)
            if account:
                account.deposit(amount)
            else:
                print("Account not found.")

        elif choice == "3":
            account_number = input("Enter account number: ")
            amount = float(input("Enter withdrawal amount: "))
            account = bank.get_account(account_number)
            if account:
                account.withdraw(amount)
            else:
                print("Account not found.")

        elif choice == "4":
            account_number = input("Enter account number: ")
            account = bank.get_account(account_number)
            if account:
                account.display_balance()
            else:
                print("Account not found.")

        elif choice == "5":
            print("Thank you for banking with us. Goodbye!")
            break

        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()

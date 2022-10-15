// enums
// ! enums for register toggle
enum RegisterToggle { signUp, signIn }

// ! enum for page tab
enum PageIndex { home, payment, loans, cards, more }

// ! enum for loan history or loan list page
enum LoanStatus { pending, running, overdue, completed }

// ! enum for saving history or loan list page
enum SavingStatus { fixedGoal, spendSave, investment, stash, flexiGoal }

// view state
enum ViewState { busy, error, idle, success, exception }

// transaction state
enum TransactionHistoryState { idle, success, loading, exception, error }

// drop down value
enum DropDownEnum { banks, gender, document }

// Tier3Requirements
enum Tier3Requirements { personal_detail, bank_verification, photo_id }

// Gender
String selectedGender = "";
final List<String>? Gender = ["Male", "Female"];

// KYC Documents
enum KYCDocumentProof { driver_licence, voters_card, international_passport }

// for dev environment
enum DevEnvironment { staging, dev, production }

// biometeric support enum
enum SupportState { unknown, supported }

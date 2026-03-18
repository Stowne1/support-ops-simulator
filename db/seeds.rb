SupportEmail.destroy_all
Ticket.destroy_all
User.destroy_all

sam = User.create!(
  email: "sam@gmial.com",
  first_name: "Sam",
  last_name: "Towne",
  status: "active",
  login_disabled: true
)

alex = User.create!(
  email: "alex@example.com",
  first_name: "Alex",
  last_name: "Rivera",
  status: "inactive",
  login_disabled: false
)

jordan = User.create!(
  email: "jordan@example.com",
  first_name: "Jordan",
  last_name: "Lee",
  status: "active",
  login_disabled: false
)

ticket1 = Ticket.create!(
  user: sam,
  subject: "Cannot receive password reset",
  description: "Customer says password reset emails never arrive.",
  status: "open",
  priority: "high",
  source: "email",
  assigned_to: "junior_support"
)

ticket2 = Ticket.create!(
  user: alex,
  subject: "Account should be active",
  description: "Customer says they already paid but account still shows inactive.",
  status: "open",
  priority: "medium",
  source: "email",
  assigned_to: "junior_support"
)

ticket3 = Ticket.create!(
  user: nil,
  subject: "Unsure which account this belongs to",
  description: "Support received an email but could not confidently match the account.",
  status: "open",
  priority: "low",
  source: "email",
  assigned_to: "junior_support"
)

SupportEmail.create!(
  user: sam,
  ticket: ticket1,
  from_email: "sam.towne@gmail.com",
  to_email: "support@company.com",
  subject: "Still not getting login email",
  body: "Hi, I think my email may be wrong on my account because I never get the password reset email.",
  received_at: 2.hours.ago,
  processed: false
)

SupportEmail.create!(
  user: alex,
  ticket: ticket2,
  from_email: "alex@example.com",
  to_email: "support@company.com",
  subject: "Why is my account inactive?",
  body: "I already paid and my account still says inactive. Can someone fix this?",
  received_at: 5.hours.ago,
  processed: false
)

SupportEmail.create!(
  user: nil,
  ticket: ticket3,
  from_email: "jordn@example.com",
  to_email: "support@company.com",
  subject: "Need help accessing account",
  body: "I might have used a different email when I signed up. I cannot get in.",
  received_at: 1.day.ago,
  processed: false
)

puts "Seeded #{User.count} users, #{Ticket.count} tickets, and #{SupportEmail.count} support emails."
#Create user admin
User.create!(name: "Example User",
  email: "example@railstutorial.org",
  phone: "0905278872",
  address: "123 Main Street",
  password: "abcAbc123@",
  password_confirmation: "abcAbc123@",
  role: 1)

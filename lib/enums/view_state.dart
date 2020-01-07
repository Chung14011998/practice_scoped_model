//If your app retrieves its data from a service or even from a local DB then you have 4 Default states
//Idle, Busy (Fetching Data), Retrieved and Error
enum ViewState {
  Idle,
  Busy,
  Retrieved,
  Error
}
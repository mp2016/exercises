# Exercise 1

Edit the discovery example seen in class as in the following.

- Add a new service, Multiplier, that can multiply numbers.
- Make Multiplier register to the registry as the new type "Multiplier".
- Discover Multiplier from the client using the registry.
- Use Multiplier to multiply the result you got from the Calculator by 2.

# Exercise 2

- Add a new operation, unregister, to the Registry for unregistering services.
- Add an operation to Calculator, shutdown, that when called unregisters the Calculator from the Registry.
- Make a new program for calling unregister at a Calculator.

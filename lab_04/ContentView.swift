import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(person.firstName)
                .font(.largeTitle)
                .padding()
            Text("Age: \(person.age)")
                .font(.headline)
                .padding(.bottom)
            Text("Gender: \(person.gender)")
                .padding(.bottom)
            Text("Address:")
                .font(.headline)
                .padding(.bottom)
            Text("\(person.address.streetAddress), \(person.address.city), \(person.address.state), \(person.address.postalCode)")
                .padding(.bottom)
            Text("Phone Numbers:")
                .font(.headline)
                .padding(.bottom)
            ForEach(person.phoneNumbers) { phone in
                Text("\(phone.type): \(phone.number)")
                    .padding(.bottom, 2)
            }
            Spacer()
        }
        .navigationTitle("Details")
        .padding()
    }
}

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        NavigationView {
            List(people) { person in
                NavigationLink(destination: PersonDetailView(person: person)) {
                    Text(person.firstName)
                }
            }
            .navigationTitle("People")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
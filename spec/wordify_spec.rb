require('rspec')
require('wordify')

describe("Fixnum#wordify") do
  it('returns the word equivalent of a single digit number') do
    expect(4.wordify()).to(eq("four"))
  end
  it('returns the word equivalent of a double digit number less than 20') do
    expect(14.wordify()).to(eq("fourteen"))
  end
  it('returns the word equivalent of a double digit number more than 19, less than 100') do
    expect(24.wordify()).to(eq("twenty four"))
  end
  it('returns the word equivalent of a triple digit number') do
    expect(555.wordify()).to(eq("five hundred fifty five"))
  end
  it('returns the word equivalent of a four digit number') do
    expect(5555.wordify()).to(eq("five thousand five hundred fifty five"))
  end
  it('returns the word equivalent of any number up to 999999999999999') do
    expect(999999999999999.wordify()).to(eq("nine hundred ninety nine trillion nine hundred ninety nine billion nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine"))
  end
end

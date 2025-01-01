# Spectus

[![Version](https://img.shields.io/github/v/tag/fixrb/spectus?label=Version&logo=github)](https://github.com/fixrb/spectus/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/spectus/main)
[![License](https://img.shields.io/github/license/fixrb/spectus?label=License&logo=github)](https://github.com/fixrb/spectus/raw/main/LICENSE.md)

> A Ruby testing library that brings precision to your expectations using RFC 2119 compliance levels. 🚥

## Quick Start

```ruby
require "spectus"
require "matchi"

# Define a must-have requirement
test = Spectus.must Matchi::Eq.new(42)
test.call { 42 } # => Pass ✅

# Define an optional feature
test = Spectus.may Matchi::Be.new(:empty?)
test.call { [].empty? } # => Pass ✅
```

## Installation

Add to your Gemfile:

```ruby
gem "spectus"
gem "matchi" # For matchers
```

Or install directly:

```bash
gem install spectus
gem install matchi
```

## Understanding RFC 2119

Spectus implements [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) requirement levels to bring clarity and precision to test expectations:

- **MUST** (✅): Absolute requirement, no exceptions
- **SHOULD** (⚠️): Strong recommendation with valid exceptions
- **MAY** (💡): Optional feature

This approach helps you clearly communicate the importance of each test in your suite.

## Features

### Requirement Levels

| Level | Description | Pass Conditions |
|-------|-------------|-----------------|
| MUST | Absolute requirement | Only when exact match |
| SHOULD | Recommended behavior | When matches or has valid reason not to |
| MAY | Optional feature | When matches or not implemented |

### Results Classification

- **Pass Results:**
  - ✅ Success (MUST level met)
  - ⚠️ Warning (SHOULD level met)
  - 💡 Info (MAY level met)

- **Fail Results:**
  - ❌ Failure (requirement not met)
  - 💥 Error (unexpected exception)

## Usage Examples

### Testing Required Behavior

```ruby
test = Spectus.must Matchi::Be.new(1)
test.call { "🦇".size } # Must be exactly 1
```

### Testing Recommended Behavior

```ruby
test = Spectus.should Matchi::Be.new(0.3)
test.call { 0.1 + 0.2 } # Should be close to 0.3
```

### Testing Optional Features

```ruby
test = Spectus.may Matchi::Be.new(true)
test.call { [].blank? } # May implement blank? method
```

## Advanced Usage

<details>
<summary>Click to expand custom matcher example</summary>

```ruby
class PositiveNumber
  def match?
    yield.positive?
  end
end

test = Spectus.must PositiveNumber.new
test.call { 42 } # => Pass
```
</details>

<details>
<summary>Click to expand integration example</summary>

```ruby
require "spectus"
require "matchi"

RSpec.describe Calculator do
  it "must perform exact arithmetic" do
    test = Spectus.must Matchi::Eq.new(4)
    expect { test.call { 2 + 2 } }.not_to raise_error
  end
end
```
</details>

## Related Projects

- [Matchi](https://github.com/fixrb/matchi) - Collection of compatible matchers
- [Test Tube](https://github.com/fixrb/test_tube) - Underlying test execution engine
- [Expresenter](https://github.com/fixrb/expresenter) - Test result presentation

## License

Released under the [MIT License](LICENSE.md).

## Support

- Issues: [GitHub Issues](https://github.com/fixrb/spectus/issues)
- Documentation: [RubyDoc](https://rubydoc.info/github/fixrb/spectus/main)
- Blog Post: [Medium Article](https://cyrilllllll.medium.com/a-spectus-tutorial-expectations-with-rfc-2119-compliance-1fc769861c1)

## Sponsors

This project is sponsored by [Sashité](https://sashite.com/)

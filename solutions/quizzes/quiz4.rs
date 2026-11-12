// This quiz tests iterators, parsing, and error handling.
//
// Implement `parse_and_sum` to parse each string as an i32 and return the sum.
// Return the parsing error if any string is invalid. An empty slice sums to 0.
// You may assume the sum of valid numbers fits in an i32.

use std::num::ParseIntError;

fn parse_and_sum(values: &[&str]) -> Result<i32, ParseIntError> {
    values.iter().try_fold(0, |sum, value| {
        Ok(sum + value.parse::<i32>()?)
    })
}

fn main() {}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sums_numbers() {
        assert_eq!(parse_and_sum(&["4", "-2", "7"]).unwrap(), 9);
    }

    #[test]
    fn empty_input_sums_to_zero() {
        assert_eq!(parse_and_sum(&[]).unwrap(), 0);
    }

    #[test]
    fn rejects_invalid_numbers() {
        assert!(parse_and_sum(&["1", "nope", "3"]).is_err());
    }

    #[test]
    fn rejects_numbers_outside_i32_range() {
        assert!(parse_and_sum(&["2147483648"]).is_err());
    }
}

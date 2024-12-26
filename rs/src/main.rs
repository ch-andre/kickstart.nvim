fn foo(s: &str) -> &str {
    println!("Hello: {s}");

    let x = Some(4);

    if let Some(y) = x {
        println!("Hello: {y}");
    }

    s
}

fn main() {
    foo("World");
}

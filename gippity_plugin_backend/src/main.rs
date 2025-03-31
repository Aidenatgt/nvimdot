use std::error::Error;

use clap::{Parser, Subcommand};

#[derive(Debug, Parser)]
struct Cli {
    #[command(subcommand)]
    command: Command,
}

#[derive(Debug, Subcommand)]
enum Command {
    Edit {
        #[arg(short, long)]
        prompt: String,
        #[arg(short, long)]
        file_contents: String,
    },
    Review {
        #[arg(short, long)]
        prompt: String,
        #[arg(short, long)]
        file_contents: String,
    },
    Chat {
        #[arg(short, long)]
        prompt: String,
    },
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let cli = Cli::parse();

    match cli.command {
        Command::Edit {
            prompt,
            file_contents,
        } => println!("edit:\n\tprompt = {prompt}\n\tfile_contents={file_contents}"),
        Command::Review {
            prompt,
            file_contents,
        } => println!("review:\n\tprompt = {prompt}\n\tfile_contents={file_contents}"),
        Command::Chat { prompt } => println!("chat:\n\tprompt = {prompt}"),
    }

    Ok(())
}

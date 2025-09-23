# CohabitCodingTest

A Rails application for importing and viewing user data from CSV files.

## Prerequisites

- Ruby (version specified in `.ruby-version` or `Gemfile`)
- PostgreSQL
- Bundler

## Setup

### Quick Setup (Recommended)

Run the automated setup script:

```bash
git clone <repository-url>
cd CohabitCodingTest
bin/setup
```

This script will:
- Install Ruby dependencies
- Copy `.env.example` to `.env`
- Create and setup the database
- Clear logs and temp files

After setup completes, start the server:
```bash
rails server
```

### Manual Setup

If you prefer to set up manually:

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd CohabitCodingTest
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Configure database**
   ```bash
   # Copy the example environment file
   cp .env.example .env

   # Edit .env with your database credentials (if needed)
   # Default settings work with standard PostgreSQL installation
   ```

4. **Create and setup the database**
   ```bash
   rails db:create
   rails db:migrate
   ```

5. **Start the Rails server**
   ```bash
   rails s
   ```

6. **Access the application**
   - Navigate to `http://localhost:3000`
   - Import a CSV file using the form
   - View imported users data

## Database Configuration

The application uses PostgreSQL with environment-based configuration. Default settings:
- Host: `localhost`
- Username: `postgres`
- Password: (empty by default)

To customize, edit the `.env` file with your local PostgreSQL credentials.

## Usage

1. Go to the root path (localhost:3000)
2. Import the CSV file using the provided form
3. After import, you'll be redirected to the users view

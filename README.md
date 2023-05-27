<a name="readme-top"></a>

<details>
<summary>Table of Contents</summary>

- [📰 Blogify - Rails App ](#-blogify---rails-app-)
  - [🧰 Tech Stack ](#-tech-stack--)
  - [✨ Key Features ](#-key-features--)
  - [📘 Getting Started ](#-getting-started--)
    - [📋 Prerequisites](#-prerequisites)
    - [📂 Setup](#-setup)
    - [📥 Installation](#-installation)
    - [💾 Database](#-database)
    - [💻 Usage](#-usage)
    - [🧪 Run tests](#-run-tests)
  - [👨‍🚀 Authors ](#-authors--)
  - [🎯 Future Features ](#-future-features--)
  - [🤝 Contribution ](#-contribution--)
  - [💖 Show Your Support ](#-show-your-support--)
  - [🙏 Acknowledgements](#-acknowledgements)
  - [📜 License ](#-license-)
  </details>

# 📰 Blogify - Rails App <a name="about-project"></a>

**Blogify** is a simple, easy-to-use blogging platform which allows users to create and publish their own blog posts. Users can also read posts from other users and give likes/comments.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🧰 Tech Stack <a name="tech-stack"></a>

- Ruby on Rails
- PostgreSQL

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ✨ Key Features <a name="key-features"></a>

- Create and manage blog posts
- Read posts by other users
- Interact by giving likes/comments
- User authentication and authorization
- Install CanCanCan in your project.
- Add a role column to the users table.
- A user can delete a post if it is theirs or if they have an admin role.
- A user can delete a comment if it is theirs or if they have an admin role.
- Create an API endpoint to list all posts for a user.
- Create an API endpoint to list all comments for a user's post.
- Create an API endpoint to add a comment to a post. Remember that the owner of the comment is the user that makes it; it should not be set by passing a parameter.
- Our API endpoints should receive JSON and respond JSON as well.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📘 Getting Started <a name="getting-started"></a>

To run this project locally, you'll need to follow these steps.

### 📋 Prerequisites

Make sure you have the following installed on your machine:

- [Ruby 3.1.3 or higher](https://www.ruby-lang.org/en/)
- [Rails 7.0.4 or higher](https://rubyonrails.org/)
- [PostgreSQL 15.2 or higher](https://www.postgresql.org/)

### 📂 Setup

Clone this repository to your desired folder.

```sh
git clone git@github.com:mohisa302/Blog-app.git .
cd Blogify
```

### 📥 Installation

Install the required gems with:

```sh
bundle install
```

### 💾 Database

Create the databases and run migrations with:

```sh
rails db:create
rails db:migrate
```

### 💻 Usage

To run the development server, execute the following command:

```sh
rails server
```

### 🧪 Run tests

To run tests, run the following command:

```sh
rspec spec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👨‍🚀 Authors <a name="author"></a>

👤 **Mohi**

- GitHub: [@mohisa302](https://github.com/mohisa302)
- Twitter: [@Kholochelam](https://twitter.com/Kholochelam)
- LinkedIn: [LinkedIn](https://linkedin.com/in/mohadese-sadeghi-692551199/)

👤 **HABASM**

- GitHub: [@habasm](https://github.com/habasm)
- Twitter: [@habasm](https://twitter.com/habasm)
- LinkedIn: [LinkedIn](https://linkedin.com/in/habasm)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🎯 Future Features <a name="future-features"></a>

- [ ] Add tests
- [ ] Create API endpoints
- [ ] Implement authentication

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contribution <a name="contribution"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/bernabasy/Blogify/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💖 Show Your Support <a name="support"></a>

If you like this project, please consider giving it a ⭐.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgements

I would like to thank all code reviewers for making this project better.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📜 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

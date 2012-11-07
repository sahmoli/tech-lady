function install_bundle {
	bundle install --system --without production
}

function build_local {
	install_bundle && \
	migrate && \
	RAILS_ENV=test rake test && \
	RAILS_ENV=test bundle exec rspec
}

function ut {
	migrate && \
	RAILS_ENV=test rake test && \
	RAILS_ENV=test bundle exec rspec
}

function migrate {
	RAILS_ENV=test rake db:drop db:create db:migrate
}

function server {
	RAILS_ENV=development rake db:drop db:create db:migrate db:fixtures:load && \
	RAILS_ENV=development rails s
}


function usage {
	printf "
options:
       h: Display this
       m: Migrate Database
      ut: Run Unit Test only
       s: Start Server
       *: Run local build script

"
}

function main {
  	case $1 in
		h) usage ;;
		ut) ut ;;
		m) migrate ;;
		s) server ;;
		*) build_local ;;
	esac
}

main $@
abbr cat 'bat --paging=always --style=plain --color=always'
abbr l 'ls -la'

abbr dbl 'docker build'
abbr dcin 'docker container inspect'
abbr dcls 'docker container ls'
abbr dclsa 'docker container ls -a'
abbr dib 'docker image build'
abbr dii 'docker image inspect'
abbr dils 'docker image ls'
abbr dipu 'docker image push'
abbr dipru 'docker image prune -a'
abbr dirm 'docker image rm'
abbr dit 'docker image tag'
abbr dlo 'docker container logs'
abbr dnc 'docker network create'
abbr dncn 'docker network connect'
abbr dndcn 'docker network disconnect'
abbr dni 'docker network inspect'
abbr dnls 'docker network ls'
abbr dnrm 'docker network rm'
abbr dpo 'docker container port'
abbr dps 'docker ps'
abbr dpsa 'docker ps -a'
abbr dpu 'docker pull'
abbr dr 'docker container run'
abbr drit 'docker container run -it'
abbr drm 'docker container rm'
abbr drm! 'docker container rm -f'
abbr dst 'docker container start'
abbr drs 'docker container restart'
abbr dsta 'docker stop $(docker ps -q)'
abbr dstp 'docker container stop'
abbr dsts 'docker stats'
abbr dtop 'docker top'
abbr dvi 'docker volume inspect'
abbr dvls 'docker volume ls'
abbr dvprune 'docker volume prune'
abbr dxc 'docker container exec'
abbr dxcit 'docker container exec -it'

abbr dco 'docker compose'
abbr dcb 'docker compose build'
abbr dce 'docker compose exec'
abbr dcps 'docker compose ps'
abbr dcrestart 'docker compose restart'
abbr dcrm 'docker compose rm'
abbr dcr 'docker compose run'
abbr dcstop 'docker compose stop'
abbr dcup 'docker compose up'
abbr dcupb 'docker compose up --build'
abbr dcupd 'docker compose up -d'
abbr dcupdb 'docker compose up -d --build'
abbr dcdn 'docker compose down'
abbr dcl 'docker compose logs'
abbr dclf 'docker compose logs -f'
abbr dclF 'docker compose logs -f --tail 0'
abbr dcpull 'docker compose pull'
abbr dcstart 'docker compose start'
abbr dck 'docker compose kill'

abbr ga 'git add'
abbr gaa 'git add --all'
abbr gapa 'git add --patch'
abbr gau 'git add --update'
abbr gav 'git add --verbose'
abbr gap 'git apply'
abbr gapt 'git apply --3way'
abbr gbl 'git blame -w'
abbr gb 'git branch'
abbr gba 'git branch --all'
abbr gbd 'git branch --delete'
abbr gbD 'git branch --delete --force'

abbr gcam 'git commit --all --message'
abbr gc 'git commit --verbose'
abbr gca 'git commit --verbose --all'
abbr gcn 'git commit --verbose --no-edit'
abbr gcf 'git config --list'
abbr gcfu 'git commit --fixup'
abbr gco 'git checkout'
abbr gd 'git diff'
abbr gst 'git status'

function git_main_branch
    command git rev-parse --git-dir &>/dev/null; or return
    for ref in refs/heads/{main,trunk,mainline,default,stable,master} refs/remotes/{origin,upstream}/{main,trunk,mainline,default,stable,master}
        if command git show-ref -q --verify $ref
            echo (basename $ref)
            return 0
        end
    end

    echo master
    return 1
end

function gcm
    git checkout (git_main_branch)
end

function ggpush
    git push origin (git rev-parse --abbrev-ref HEAD)
end

function ggpull
    git pull origin (git rev-parse --abbrev-ref HEAD)
end


let g:ale_sign_column_always = 1
let b:ale_fixers=['tslint']
let g:ale_fix_on_save=1

"for ignoring .gitignorestuff in ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

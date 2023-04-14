function zat -d "Start zellij using ./zellij-workspace.kdl for the layout and using the current directory as the session name"
	# TODO: Override session name with an argument
	# TODO: Override layout with an argument
	# TODO:	Don't start a new session inside an existing session
	# TODO: Attach to existing session

	set --local session_name $(path basename $(pwd))
	set --local layout_file $(pwd)/zellij-workspace.kdl
	set --local layout ""

	if test -e $layout_file
		set layout "-l $layout_file"
	end

	eval "zellij $layout attach -c $session_name"
end

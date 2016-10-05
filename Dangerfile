if github.pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end

if github.pr_json["milestone"] > 1
  fail "Please provide only one extension per PR"
end

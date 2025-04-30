function k() {
  config="$HOME/.kube/kelm/config"

  for arg in "$@"; do
    if [[ "$arg" == "-A" || "$arg" == "--all-namespaces" ]]; then
      command kubectl "$@"
      return
    fi
  done

  # Detect subcommand safely
  expect_value=0
  for arg in "$@"; do
    if [[ "$expect_value" -eq 1 ]]; then
      expect_value=0
      continue
    fi
    case "$arg" in
      -n|--namespace|--context)
        expect_value=1
        continue
        ;;
      -*)
        continue
        ;;
      *)
        cmd="$arg"
        break
        ;;
    esac
  done

  case "$cmd" in
    get|describe|logs|top|delete|edit|scale|patch|label|annotate)
      if [[ -f "$config" ]]; then
        IFS=',' read -r release ns < "$config"
        command kubectl -n "$ns" "$@" --selector="app.kubernetes.io/instance=$release"
      else
        command kubectl "$@"
      fi
      ;;
    *)
      command kubectl "$@"  # passthrough
      ;;
  esac
}
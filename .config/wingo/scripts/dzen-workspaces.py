import sys
import pywingo

class Active:
    def __init__(self, num, markup):
        self.num = num
        self.markup = markup

markup = {
    'current':  '^fg(#00FF00)%s^fg()',
    'visible':  '^fg(#FF0000)%s^fg()',
    'hidden':   '^fg(#FFFFFF)%s^fg()',
    'empty':    '^fg(#FFFFFF)%s^fg()',
}

W = pywingo.Wingo()

@W.bind('AddedWorkspace')
@W.bind('RemovedWorkspace')
@W.bind('ChangedWorkspace')
@W.bind('ChangedVisibleWorkspace')
@W.bind('ChangedWorkspaceNames')
@W.bind('ManagedClient')
@W.bind('UnmanagedClient')
@W.bind('Subscribed')
def show(_):
    current = W.GetWorkspace()
    visible = W.GetVisibleWorkspaceList()
    hidden = W.GetHiddenWorkspaceList()
    vtagged = []
    for space in visible:
        if space == current:
            vtagged.append(Active(space, markup['current']))
        else:
            vtagged.append(Active(space, markup['visible']))
    bar = range(1,len(hidden) + len(visible) +1)
    try:
        for head in vtagged:
            bar[int(head.num) - 1] = "[%s]" % (head.markup % head.num)
    except Exception as e:
        open("/home/xeno/f").write(str(e)+"\n")

    print '   '.join(map(str, bar))
    sys.stdout.flush()

W.loop()

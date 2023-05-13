# List of keymaps

## Space as leader

## Motion
| key     | Descpription              |
| ------- | ------------------------- |
| j       | left                      |
| k       | down                      |
| l       | up                        | 
| ;       | right                     |
| \<A-j\> | window left               |
| \<A-k\> | window up                 |
| \<A-l\> | window down               |
| \<A-;\> | window right              |


## Debugging
| key         | Description               |
| ----------- | ------------------------- |
| <leader>dt  | toggle breakpoint         |
| <leader>do  | step over breakpoint      |
| <leader>di  | step into breakpoint      |
| <leader>dc  | continue from breakpoint  |
| <leader>dt  | start debugging           |
| <leader>dq  | close debug UI            |

## Nvim-Tree
| key | Description                |
| --- | -------------------------- |
| f   | toggle open                |
| a   | create new file            |
| d   | remove file                |
| r   | rename file                |
| y   | copy name                  |
| Y   | copy path                  |
| x   | cut file                   |
| c   | copy file                  |
| p   | paste file                 |
| f   | filter (inside nvim tree)  |
| E   | expand all folders         |
| W   | collapse all folders       |

## buffer switching
| key | Description               |
| --- | ------------------------- |
| F1  | next buffer (cycles)      |
| F2  | previous buffer (cycles)  |

## formatting
| key | Description               |
| --- | ------------------------- |
| F4  | format this file          |

## telescope
| key         | Description               |
| ----------- | ------------------------- |
| <leader>ff  | find files                |
| <leader>fg  | live ripgrep              |
| <leader>fh  | help for functions etc    |
| <leader>fp  | find projects             |
| <leader>fb  | file browser              |

### telescope git
| key        | Description               |
| ---------- | ------------------------- |
| <leader>gq | show commits              |
| <leader>gw | show commits with diff    |
| <leader>ge | show branches             | 
| <leader>gr | show git status           |
| <leader>ga | show git stash            | 

### project telescope
<table> <tr> <th> normal mode </th> <th> insert mode </th></tr>
<tr> <td>

| key | Description                       |
| --- | --------------------------------- |
|  d  | delete project                    |
|  r  | rename project                    |
|  c  | create project                    |
|  s  | search files in project           |
|  b  | browse files in project           |
|  w  | change directory to project       |
|  R  | recently opened files in project  |
|  f  | find file within project          |
</td> <td>

| key      | Description                       |
| -------- | --------------------------------- |
| Ctrl + d | delete project                    |
| Ctrl + v | rename project                    |
| Ctrl + a | create project                    |
| Ctrl + s | search files in project           |
| Ctrl + b | browse files in project           |
| Ctrl + l | change directory to project       |
| Ctrl + r | recently opened files in project  |
| Ctrl + f | find file within project          |

</td> </tr> </table>


## toggletrouble
| key      | Description               |
| -------- | ------------------------- |
| Ctrl + f | show errors and warnings  |

## cmp
Note, these require the cmp list view to be open to do anything!
| key         | Description                                               |
| ----------- | --------------------------------------------------------- |
| Ctrl + b    | scroll docs up                                            |
| Ctrl + f    | scroll docs down                                          |
| Ctrl + e    | cancel cmp                                                |
| Enter       | write selected suggestion (does nothing if not selected)  |
| Tab         |scroll down through suggestion list                        |
| Shift + Tab | scroll up through suggestion list                         |

## LSP 
| key          |  Description           |
| ------------ | ---------------------- |
|  Leader + ca | go to declaration      |
|  Leader + cs | go to definition       |
|  Leader + cd | go to type definitions |
|  Leader + cf | go to references       |
|  Leader + cq | execute code actions   |
|  Leader + cw | signature help         |
|  Leader + ce | hover                  |
|  Leader + cr | rename                 |

## snippets
These require you to be inside a snippet!
| key      | Description               |
| -------- | ------------------------- |
| Ctrl + j | jump to next entry        |
| Ctrl + k | jump to previous entry    |

## Leap
| key      | Description                                            |
| -------- | ------------------------------------------------------ |
| s        | followed by 2 other characters and the marker to jump  |

## Dashboard
only available on dashboard
| key | Description               |
| --- | ------------------------- |
|  f  | file                      |
|  e  | new file                  |
|  p  | find project              |
|  r  | recently used files       |
|  t  | find text                 |
|  c  | open config               |
|  q  | quit                      |

## Treesitter specials
used to interact with treesitter defined objects.
| key | Description                          |
| --- | ------------------------------------ |
| dif | Delete the content of a function     |
| daf | Delete the entire function           |
| dic | Delete the content of a class/struct |
| dac | Delete the entire class/struct       |

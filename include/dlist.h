typedef struct _Node 
{
    struct _Node * prior;
    struct _Node * next;
    double val;
}Node;

typedef void (*processDL)(double v);

class DoubleList
{
    private:
        Node * head;
    public:
        DoubleList()
        {
            head=new Node;
            head->prior=head;
            head->next=head;
            head->val=3.4;
        }
        void add(double v)
        {
            Node *p=new Node;
            p->val=v;
            p->prior=head->prior;
            head->prior->next=p;
            p->next=head;
            head->prior=p;
        }
        void print_all(processDL pfn)
        {
            for (Node *p=head->next;p->next!=head->next;p=p->next)
                {
                    pfn(p->val);
                }
        }
};

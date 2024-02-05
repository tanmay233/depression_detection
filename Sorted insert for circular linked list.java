class Solution {
    public Node sortedInsert(Node head, int data) {
        
        Node mid= new Node(data);
        
        if(head==null){
           mid.next=mid;
           return mid;
        } 
        
        Node start=head;
        Node first=start;
        Node second=first.next;
         
        while(second!=null && second!=start){
            
            if(first.data<=data && data<=second.data) break;
            
            first=second;
            second=second.next;
        }
        
        first.next=mid;
        mid.next=second;
        
        if(data>=first.data) return start;
        
        return mid;
    }
}
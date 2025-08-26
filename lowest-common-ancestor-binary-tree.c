#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

struct TreeNode* lowestCommonAncestor(struct TreeNode* root, struct TreeNode* p, struct TreeNode* q) {
    if (root == NULL || root == p || root == q) {
        return root;
    }
    
    struct TreeNode* left = lowestCommonAncestor(root->left, p, q);
    struct TreeNode* right = lowestCommonAncestor(root->right, p, q);
    
    if (left != NULL && right != NULL) {
        return root;
    }
    
    return left != NULL ? left : right;
}

struct TreeNode* newNode(int val) {
    struct TreeNode* node = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    node->val = val;
    node->left = NULL;
    node->right = NULL;

    return node;
}

const int main(void) {

    struct TreeNode* root = newNode(3);

    root->left = newNode(5);
    root->right = newNode(1);
    root->left->left = newNode(6);
    root->left->right = newNode(2);
    root->right->left = newNode(0);
    root->right->right = newNode(8);
    root->left->right->left = newNode(7);
    root->left->right->right = newNode(4);

    struct TreeNode* p = root->left;
    struct TreeNode* q = root->right;

    struct TreeNode* lca = lowestCommonAncestor(root, p, q);

    if (lca != NULL) {
        printf("El ancestro común más bajo de %d y %d es: %d\n", p->val, q->val, lca->val);
    } else {
        printf("No se encontró un ancestro común.\n");
    }

    p = root->left;
    q = root->left->right->right;

    lca = lowestCommonAncestor(root, p, q);

    if (lca != NULL) {
        printf("El ancestro común más bajo de %d y %d es: %d\n", p->val, q->val, lca->val);
    } else {
        printf("No se encontró un ancestro común.\n");
    }

    free(root->left->right->left);
    free(root->left->right->right);
    free(root->left->left);
    free(root->left->right);
    free(root->right->left);
    free(root->right->right);
    free(root->left);
    free(root->right);
    free(root);

    return 0;
}
